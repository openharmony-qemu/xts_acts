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
  observeMathAcosInvalidStringConversion,
  observeMathAcosNullConversion,
  observeMathAcosStringConversion,
  observeMathAcosUndefinedConversion
} from './MathAcos';
import {
  isApprox,
  isFiniteValue,
  isNaNValue
} from '../MathTestUtils';

function callMathAcosWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.acos(input);
  }
  return Math.acos(Number(input));
}

export default function mathAcosTest(): void {
  describe('MathAcosTest', (): void => {
    /**
     * @tc.name testMathAcos001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0100
     * @tc.desc Verify upper domain endpoint returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcos002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0200
     * @tc.desc Verify zero returns PI divided by two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(0);
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0300
     * @tc.desc Verify lower domain endpoint returns PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(-1);
      const isApproxResult: boolean = isApprox(result, Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0400
     * @tc.desc Verify input above the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(1.01);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAcosWithUnion(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcos007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAcosWithUnion('1');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcos008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcosStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcos009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_0900
     * @tc.desc Verify negative one half returns two PI divided by three
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(-0.5);
      const isApproxResult: boolean = isApprox(result, 2 * Math.PI / 3, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1000
     * @tc.desc Verify an interior value near the lower endpoint remains finite
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(-0.9999999999999999);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(3.141592638688632, 1e-12);
    });

    /**
     * @tc.name testMathAcos011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1100
     * @tc.desc Verify cosine reverses acos inside the principal domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.25;
      const result: number = Math.cos(Math.acos(input));
      const isApproxResult: boolean = isApprox(result, input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1200
     * @tc.desc Verify acos symmetry sums to PI
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.acos(0.25);
      const negative: number = Math.acos(-0.25);
      const isApproxResult: boolean = isApprox(positive + negative, Math.PI, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos013
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1300
     * @tc.desc Verify acos decreases across ordered domain inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lowerInput: number = Math.acos(-0.5);
      const middleInput: number = Math.acos(0);
      const upperInput: number = Math.acos(0.5);
      expect(lowerInput).assertLarger(middleInput);
      expect(middleInput).assertLarger(upperInput);
    });

    /**
     * @tc.name testMathAcos014
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1400
     * @tc.desc Verify input below the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acos(-1.01);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos015
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1500
     * @tc.desc Verify raw null coercion reaches the acos domain boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcosNullConversion();
      const isApproxResult: boolean = isApprox(result, Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos016
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1600
     * @tc.desc Verify an invalid numeric string produces NaN for acos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcosInvalidStringConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcos017
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOS_1700
     * @tc.desc Verify undefined conversion produces NaN for acos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcos017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcosUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

  });
}
