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
  observeMathRoundNullConversion,
  observeMathRoundStringConversion
} from './MathRound';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathRoundWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.round(input);
  }
  return Math.round(Number(input));
}

export default function mathRoundTest(): void {
  describe('MathRoundTest', (): void => {
    /**
     * @tc.name testMathRound001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0100
     * @tc.desc Verify fraction below the half boundary rounds down
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(3.4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathRound002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0200
     * @tc.desc Verify positive half boundary rounds toward positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(3.5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathRound003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0300
     * @tc.desc Verify negative half boundary rounds toward positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(-3.5);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathRound004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0400
     * @tc.desc Verify negative fraction below one produces negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(-0.1);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathRound005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathRound006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathRoundWithUnion(3.5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathRound007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathRoundWithUnion('3.5');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathRound008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathRoundStringConversion();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathRound009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_0900
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathRound010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_1000
     * @tc.desc Verify negative one half rounds to negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(-0.5);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathRound011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_1100
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathRound012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_1200
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.round(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathRound013
     * @tc.number SUB_BUILTINS_UTIL_MATH_ROUND_1300
     * @tc.desc Verify null converts to positive zero for round
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRound013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathRoundNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
