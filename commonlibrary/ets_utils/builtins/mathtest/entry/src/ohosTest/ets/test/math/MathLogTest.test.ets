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
  observeMathLogNullConversion,
  observeMathLogStringConversion
} from './MathLog';
import {
  isApprox,
  isFiniteValue,
  isNaNValue
} from '../MathTestUtils';

function callMathLogWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.log(input);
  }
  return Math.log(Number(input));
}

export default function mathLogTest(): void {
  describe('MathLogTest', (): void => {
    /**
     * @tc.name testMathLog001
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0100
     * @tc.desc Verify one returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog002
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0200
     * @tc.desc Verify E returns one within precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(Math.E);
      const isApproxResult: boolean = isApprox(result, 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathLog003
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0300
     * @tc.desc Verify positive zero returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog004
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0400
     * @tc.desc Verify negative finite input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(-1);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog005
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0500
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathLog006
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLogWithUnion(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog007
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLogWithUnion('1');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog008
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLogStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog009
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_0900
     * @tc.desc Verify negative zero returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(-0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog010
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog011
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_1100
     * @tc.desc Verify reciprocal inputs produce opposite logarithms
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.log(2);
      const reciprocal: number = Math.log(0.5);
      const isApproxResult: boolean = isApprox(reciprocal, -positive, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathLog012
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_1200
     * @tc.desc Verify minimum positive input produces a finite negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(Number.MIN_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(-744.4400719213812, 1e-12);
    });

    /**
     * @tc.name testMathLog013
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_1300
     * @tc.desc Verify maximum finite input produces a finite positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log(Number.MAX_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(709.782712893384, 1e-12);
    });

    /**
     * @tc.name testMathLog014
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG_1400
     * @tc.desc Verify null converts to positive zero and logarithm returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLogNullConversion();
      expect(result).assertEqual(-Infinity);
    });

  });
}
