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
  observeMathHypotNullConversion,
  observeMathHypotStringConversion,
  observeMathHypotUndefinedConversion
} from './MathHypot';
import {
  isApprox,
  isNaNValue,
  isPositiveZero
} from '../MathTestUtils';

function callMathHypotWithUnion(first: number | string, second: number | string): number {
  const firstValue: number = typeof first === 'number' ? first : Number(first);
  const secondValue: number = typeof second === 'number' ? second : Number(second);
  return Math.hypot(firstValue, secondValue);
}

export default function mathHypotTest(): void {
  describe('MathHypotTest', (): void => {
    /**
     * @tc.name testMathHypot001
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0100
     * @tc.desc Verify zero arguments return positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathHypot002
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0200
     * @tc.desc Verify one negative argument returns its magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(-3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathHypot003
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0300
     * @tc.desc Verify three four pair returns five
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(3, 4);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testMathHypot004
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0400
     * @tc.desc Verify Infinity takes precedence over NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(Infinity, NaN);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathHypot005
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0500
     * @tc.desc Verify NaN without Infinity produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(NaN, 1);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathHypot006
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0600
     * @tc.desc Verify large finite operands are scaled without intermediate overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(1e200, 1e200);
      const isApproxResult: boolean = isApprox(result, 1.414213562373095e200, 1e186);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathHypot007
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0700
     * @tc.desc Verify number union members reach the rest-parameter Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathHypotWithUnion(3, 4);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testMathHypot008
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0800
     * @tc.desc Verify string union members are normalized before the rest-parameter Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathHypotWithUnion('3', '4');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testMathHypot009
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_0900
     * @tc.desc Verify member-local JavaScript string values undergo numeric coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathHypotStringConversion();
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testMathHypot010
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1000
     * @tc.desc Verify a single negative zero argument returns positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(-0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathHypot011
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1100
     * @tc.desc Verify a single negative Infinity argument returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(-Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathHypot012
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1200
     * @tc.desc Verify a single maximum finite argument remains finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(Number.MAX_VALUE);
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name testMathHypot013
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1300
     * @tc.desc Verify a minimum positive component paired with zero preserves precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(Number.MIN_VALUE, 0);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name testMathHypot014
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1400
     * @tc.desc Verify trailing Infinity takes precedence over leading NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(NaN, Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathHypot015
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1500
     * @tc.desc Verify five arguments produce the expected Euclidean norm
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(1, 2, 3, 4, 5);
      const isApproxResult: boolean = isApprox(result, Math.sqrt(55), 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathHypot016
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1600
     * @tc.desc Verify multiple maximum finite arguments overflow only in the final result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.hypot(Number.MAX_VALUE, Number.MAX_VALUE);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathHypot017
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1700
     * @tc.desc Verify an explicit undefined rest argument produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathHypotUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathHypot018
     * @tc.number SUB_BUILTINS_UTIL_MATH_HYPOT_1800
     * @tc.desc Verify null rest argument converts to zero without changing the hypotenuse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathHypot018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathHypotNullConversion();
      expect(result).assertEqual(4);
    });

  });
}
