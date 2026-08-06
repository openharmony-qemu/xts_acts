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
  observeMathAbsStringConversion
} from './MathAbs';
import {
  isNaNValue,
  isPositiveZero
} from '../MathTestUtils';

function callMathAbsWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.abs(input);
  }
  return Math.abs(Number(input));
}

export default function mathAbsTest(): void {
  describe('MathAbsTest', (): void => {
    /**
     * @tc.name testMathAbs001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0100
     * @tc.desc Verify negative finite input returns its magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.abs(-5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testMathAbs002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0200
     * @tc.desc Verify negative zero becomes positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.abs(-0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathAbs003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0300
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.abs(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAbs004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0400
     * @tc.desc Verify negative Infinity becomes positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.abs(-Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathAbs005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0500
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAbsWithUnion(-4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathAbs006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0600
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAbsWithUnion('-4');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathAbs007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0700
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAbsStringConversion();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathAbs008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0800
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.abs(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathAbs009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ABS_0900
     * @tc.desc Verify positive zero input remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAbs009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.abs(+0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
