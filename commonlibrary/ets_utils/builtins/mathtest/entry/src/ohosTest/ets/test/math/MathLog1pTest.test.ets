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
  observeMathLog1pInvalidStringConversion,
  observeMathLog1pNullConversion,
  observeMathLog1pStringConversion,
  observeMathLog1pUndefinedConversion
} from './MathLog1p';
import {
  isApprox,
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathLog1pWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.log1p(input);
  }
  return Math.log1p(Number(input));
}

export default function mathLog1pTest(): void {
  describe('MathLog1pTest', (): void => {
    /**
     * @tc.name testMathLog1p001
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0100
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p002
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0200
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p003
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0300
     * @tc.desc Verify negative one returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(-1);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog1p004
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0400
     * @tc.desc Verify input below negative one produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(-1.01);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p005
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0500
     * @tc.desc Verify E minus one returns one within precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(Math.E - 1);
      const isApproxResult: boolean = isApprox(result, 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p006
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLog1pWithUnion(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog1p007
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLog1pWithUnion('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog1p008
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog1pStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog1p009
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_0900
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathLog1p010
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_1000
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p011
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_1100
     * @tc.desc Verify minimum positive input retains log1p precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log1p(Number.MIN_VALUE);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name testMathLog1p012
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_1200
     * @tc.desc Verify raw null coercion reaches log1p as positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog1pNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p013
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_1300
     * @tc.desc Verify an invalid numeric string produces NaN for log1p
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog1pInvalidStringConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog1p014
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG1P_1400
     * @tc.desc Verify undefined conversion produces NaN for log1p
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog1p014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog1pUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

  });
}
