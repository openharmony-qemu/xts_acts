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
  observeMathMinEmptyStringConversion,
  observeMathMinNullConversion,
  observeMathMinStringConversion
} from './MathMin';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathMinWithUnion(first: number | string, second: number | string): number {
  const firstValue: number = typeof first === 'number' ? first : Number(first);
  const secondValue: number = typeof second === 'number' ? second : Number(second);
  return Math.min(firstValue, secondValue);
}

export default function mathMinTest(): void {
  describe('MathMinTest', (): void => {
    /**
     * @tc.name testMathMin001
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0100
     * @tc.desc Verify zero arguments return positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min();
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathMin002
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0200
     * @tc.desc Verify single argument is returned unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(-3);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathMin003
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0300
     * @tc.desc Verify multiple arguments return the least value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(-5, 7, 2);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name testMathMin004
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0400
     * @tc.desc Verify NaN argument propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(1, NaN, 2);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathMin005
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0500
     * @tc.desc Verify negative zero wins over positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(0, -0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMin006
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0600
     * @tc.desc Verify number union members reach the rest-parameter Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathMinWithUnion(3, 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathMin007
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0700
     * @tc.desc Verify string union members are normalized before the rest-parameter Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathMinWithUnion('3', '4');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathMin008
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0800
     * @tc.desc Verify member-local JavaScript string values undergo numeric coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMinStringConversion();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathMin009
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_0900
     * @tc.desc Verify a single positive zero argument remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMin010
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1000
     * @tc.desc Verify a single negative zero argument remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMin011
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1100
     * @tc.desc Verify a single positive Infinity argument remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathMin012
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1200
     * @tc.desc Verify a single negative Infinity argument remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathMin013
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1300
     * @tc.desc Verify variadic signed zeros return negative zero when any negative zero is present
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.min(0, -0, 0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMin014
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1400
     * @tc.desc Verify minimum is commutative for finite operands
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.min(3, 7);
      const second: number = Math.min(7, 3);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathMin015
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1500
     * @tc.desc Verify nested minimum matches direct variadic minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: number = Math.min(Math.min(3, 7), 5);
      const direct: number = Math.min(3, 7, 5);
      expect(nested).assertEqual(direct);
    });

    /**
     * @tc.name testMathMin016
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1600
     * @tc.desc Verify null rest argument converts to zero for minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMinNullConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathMin017
     * @tc.number SUB_BUILTINS_UTIL_MATH_MIN_1700
     * @tc.desc Verify an empty string rest argument converts to zero for minimum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMinEmptyStringConversion();
      expect(result).assertEqual(0);
    });

  });
}
