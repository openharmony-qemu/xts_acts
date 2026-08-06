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
  observeMathCoshNullConversion,
  observeMathCoshStringConversion
} from './MathCosh';
import {
  isApprox,
  isNaNValue
} from '../MathTestUtils';

function callMathCoshWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.cosh(input);
  }
  return Math.cosh(Number(input));
}

export default function mathCoshTest(): void {
  describe('MathCoshTest', (): void => {
    /**
     * @tc.name testMathCosh001
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0100
     * @tc.desc Verify zero returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cosh(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCosh002
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0200
     * @tc.desc Verify one returns the expected approximation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cosh(1);
      const isApproxResult: boolean = isApprox(result, 1.5430806348152437, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCosh003
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0300
     * @tc.desc Verify hyperbolic cosine is even
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positive: number = Math.cosh(1);
      const negative: number = Math.cosh(-1);
      const isApproxResult: boolean = isApprox(positive, negative, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathCosh004
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0400
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cosh(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathCosh005
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0500
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCoshWithUnion(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCosh006
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0600
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathCoshWithUnion('0');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCosh007
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0700
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCoshStringConversion();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathCosh008
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0800
     * @tc.desc Verify negative Infinity returns positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cosh(-Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathCosh009
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_0900
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.cosh(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathCosh010
     * @tc.number SUB_BUILTINS_UTIL_MATH_COSH_1000
     * @tc.desc Verify null converts to zero and hyperbolic cosine returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathCosh010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathCoshNullConversion();
      expect(result).assertEqual(1);
    });

  });
}
