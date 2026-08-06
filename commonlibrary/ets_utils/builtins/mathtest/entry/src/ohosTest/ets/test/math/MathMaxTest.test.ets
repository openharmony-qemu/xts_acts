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
  observeMathMaxEmptyStringConversion,
  observeMathMaxNullConversion,
  observeMathMaxStringConversion,
  observeMathMaxUndefinedConversion
} from './MathMax';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathMaxWithUnion(first: number | string, second: number | string): number {
  const firstValue: number = typeof first === 'number' ? first : Number(first);
  const secondValue: number = typeof second === 'number' ? second : Number(second);
  return Math.max(firstValue, secondValue);
}

export default function mathMaxTest(): void {
  describe('MathMaxTest', (): void => {
    /**
     * @tc.name testMathMax001
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0100
     * @tc.desc Verify zero arguments return negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max();
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathMax002
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0200
     * @tc.desc Verify single argument is returned unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(-3);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathMax003
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0300
     * @tc.desc Verify multiple arguments return the greatest value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(-5, 7, 2);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name testMathMax004
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0400
     * @tc.desc Verify NaN argument propagates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(1, NaN, 2);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathMax005
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0500
     * @tc.desc Verify positive zero wins over negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(-0, 0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMax006
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0600
     * @tc.desc Verify number union members reach the rest-parameter Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathMaxWithUnion(3, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathMax007
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0700
     * @tc.desc Verify string union members are normalized before the rest-parameter Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathMaxWithUnion('3', '4');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathMax008
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0800
     * @tc.desc Verify member-local JavaScript string values undergo numeric coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMaxStringConversion();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathMax009
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_0900
     * @tc.desc Verify a single negative zero argument remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMax010
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1000
     * @tc.desc Verify a single positive Infinity argument remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathMax011
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1100
     * @tc.desc Verify a single negative Infinity argument remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathMax012
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1200
     * @tc.desc Verify variadic signed zeros return positive zero when any positive zero is present
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.max(-0, 0, -0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathMax013
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1300
     * @tc.desc Verify maximum is commutative for finite operands
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.max(3, 7);
      const second: number = Math.max(7, 3);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.name testMathMax014
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1400
     * @tc.desc Verify nested maximum matches direct variadic maximum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: number = Math.max(Math.max(3, 7), 5);
      const direct: number = Math.max(3, 7, 5);
      expect(nested).assertEqual(direct);
    });

    /**
     * @tc.name testMathMax015
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1500
     * @tc.desc Verify an explicit undefined rest argument produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMaxUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathMax016
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1600
     * @tc.desc Verify null rest argument converts to zero without changing the maximum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMaxNullConversion();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathMax017
     * @tc.number SUB_BUILTINS_UTIL_MATH_MAX_1700
     * @tc.desc Verify an empty string rest argument converts to zero for maximum
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathMax017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathMaxEmptyStringConversion();
      expect(result).assertEqual(4);
    });

  });
}
