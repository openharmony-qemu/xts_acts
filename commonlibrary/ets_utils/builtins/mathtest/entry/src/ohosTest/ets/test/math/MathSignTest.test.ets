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
  observeMathSignNullConversion,
  observeMathSignStringConversion
} from './MathSign';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathSignWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.sign(input);
  }
  return Math.sign(Number(input));
}

export default function mathSignTest(): void {
  describe('MathSignTest', (): void => {
    /**
     * @tc.name testMathSign001
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0100
     * @tc.desc Verify negative finite input returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(-5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathSign002
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0200
     * @tc.desc Verify positive finite input returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathSign003
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0300
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSign004
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0400
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathSign005
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathSign006
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSignWithUnion(-2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathSign007
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathSignWithUnion('-2');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathSign008
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSignStringConversion();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathSign009
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_0900
     * @tc.desc Verify positive Infinity returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(Infinity);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathSign010
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_1000
     * @tc.desc Verify negative Infinity returns negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.sign(-Infinity);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name testMathSign011
     * @tc.number SUB_BUILTINS_UTIL_MATH_SIGN_1100
     * @tc.desc Verify null converts to positive zero for sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathSign011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathSignNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
