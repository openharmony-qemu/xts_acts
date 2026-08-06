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
  observeMathLog10NullConversion,
  observeMathLog10StringConversion
} from './MathLog10';
import {
  isFiniteValue,
  isNaNValue
} from '../MathTestUtils';

function callMathLog10WithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.log10(input);
  }
  return Math.log10(Number(input));
}

export default function mathLog10Test(): void {
  describe('MathLog10Test', (): void => {
    /**
     * @tc.name testMathLog10001
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0100
     * @tc.desc Verify one returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog10002
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0200
     * @tc.desc Verify ten returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathLog10003
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0300
     * @tc.desc Verify one thousand returns three
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(1000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathLog10004
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0400
     * @tc.desc Verify positive zero returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog10005
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0500
     * @tc.desc Verify negative finite input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(-1);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog10006
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLog10WithUnion(100);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathLog10007
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLog10WithUnion('100');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathLog10008
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog10StringConversion();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testMathLog10009
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_0900
     * @tc.desc Verify negative zero returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(-0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog10010
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_1000
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathLog10011
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_1100
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog10012
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_1200
     * @tc.desc Verify minimum positive input produces a finite negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(Number.MIN_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(-323.3062153431158, 1e-12);
    });

    /**
     * @tc.name testMathLog10013
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_1300
     * @tc.desc Verify maximum finite input produces a finite positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log10(Number.MAX_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(308.25471555991675, 1e-12);
    });

    /**
     * @tc.name testMathLog10014
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG10_1400
     * @tc.desc Verify null converts to positive zero and base ten logarithm returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog10014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog10NullConversion();
      expect(result).assertEqual(-Infinity);
    });

  });
}
