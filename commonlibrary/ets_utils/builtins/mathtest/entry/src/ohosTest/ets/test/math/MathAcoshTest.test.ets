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
  observeMathAcoshInvalidStringConversion,
  observeMathAcoshNullConversion,
  observeMathAcoshStringConversion,
  observeMathAcoshUndefinedConversion
} from './MathAcosh';
import {
  isApprox,
  isFiniteValue,
  isNaNValue
} from '../MathTestUtils';

function callMathAcoshWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.acosh(input);
  }
  return Math.acosh(Number(input));
}

export default function mathAcoshTest(): void {
  describe('MathAcoshTest', (): void => {
    /**
     * @tc.name testMathAcosh001
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0100
     * @tc.desc Verify domain endpoint one returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcosh002
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0200
     * @tc.desc Verify finite input above one returns the inverse hyperbolic cosine
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(2);
      const isApproxResult: boolean = isApprox(result, 1.3169578969248166, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh003
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0300
     * @tc.desc Verify input below one produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(0.999);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh004
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0400
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathAcosh005
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0500
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAcoshWithUnion(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcosh006
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0600
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathAcoshWithUnion('1');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcosh007
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0700
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcoshStringConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathAcosh008
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0800
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh009
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_0900
     * @tc.desc Verify maximum finite input produces a finite logarithmic result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(Number.MAX_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(710.4758600739439, 1e-12);
    });

    /**
     * @tc.name testMathAcosh010
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_1000
     * @tc.desc Verify acosh reverses cosh for a nonnegative finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(Math.cosh(2));
      const isApproxResult: boolean = isApprox(result, 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh011
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_1100
     * @tc.desc Verify acosh increases across its finite domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = Math.acosh(1);
      const second: number = Math.acosh(2);
      const third: number = Math.acosh(3);
      expect(first).assertLess(second);
      expect(second).assertLess(third);
    });

    /**
     * @tc.name testMathAcosh012
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_1200
     * @tc.desc Verify negative Infinity outside the domain produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.acosh(-Infinity);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh013
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_1300
     * @tc.desc Verify raw null coercion produces NaN outside acosh domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcoshNullConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh014
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_1400
     * @tc.desc Verify an invalid numeric string produces NaN for acosh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcoshInvalidStringConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathAcosh015
     * @tc.number SUB_BUILTINS_UTIL_MATH_ACOSH_1500
     * @tc.desc Verify undefined conversion produces NaN for acosh
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathAcosh015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathAcoshUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

  });
}
