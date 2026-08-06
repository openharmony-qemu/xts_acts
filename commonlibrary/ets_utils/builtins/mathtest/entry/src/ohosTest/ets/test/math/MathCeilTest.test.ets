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
  observeMathCeilNullConversion,
  observeMathCeilStringConversion
} from './MathCeil';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathCeilWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.ceil(input);
  }
  return Math.ceil(Number(input));
}

export default function mathCeilTest(): void {
  describe('MathCeilTest', (): void => {
    /**
     * @tc.name testMathCeil001
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0100
     * @tc.desc Verify positive fraction rounds toward positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(3.2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathCeil002
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0200
     * @tc.desc Verify negative fraction rounds toward positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(-3.2);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathCeil003
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0300
     * @tc.desc Verify negative fraction below one produces negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(-0.2);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathCeil004
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0400
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathCeil005
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathCeil006
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCeilWithUnion(3.2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathCeil007
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCeilWithUnion('3.2');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathCeil008
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCeilStringConversion();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathCeil009
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_0900
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathCeil010
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_1000
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.ceil(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathCeil011
     * @tc.number SUB_BUILTINS_UTIL_MATH_CEIL_1100
     * @tc.desc Verify null converts to positive zero for ceiling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCeil011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCeilNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
