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
  observeMathLog2NullConversion,
  observeMathLog2StringConversion
} from './MathLog2';
import {
  isFiniteValue,
  isNaNValue
} from '../MathTestUtils';

function callMathLog2WithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.log2(input);
  }
  return Math.log2(Number(input));
}

export default function mathLog2Test(): void {
  describe('MathLog2Test', (): void => {
    /**
     * @tc.name testMathLog2001
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0100
     * @tc.desc Verify one returns zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathLog2002
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0200
     * @tc.desc Verify two returns one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathLog2003
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0300
     * @tc.desc Verify eight returns three
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(8);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathLog2004
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0400
     * @tc.desc Verify positive zero returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog2005
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0500
     * @tc.desc Verify negative finite input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(-1);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog2006
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLog2WithUnion(8);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathLog2007
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathLog2WithUnion('8');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathLog2008
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog2StringConversion();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathLog2009
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_0900
     * @tc.desc Verify negative zero returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(-0);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathLog2010
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_1000
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathLog2011
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_1100
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathLog2012
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_1200
     * @tc.desc Verify reciprocal power input returns a negative exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(0.125);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name testMathLog2013
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_1300
     * @tc.desc Verify minimum positive input produces a finite negative result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(Number.MIN_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(-1074, 1e-12);
    });

    /**
     * @tc.name testMathLog2014
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_1400
     * @tc.desc Verify maximum finite input produces a finite positive result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.log2(Number.MAX_VALUE);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
      expect(result).assertClose(1024, 1e-12);
    });

    /**
     * @tc.name testMathLog2015
     * @tc.number SUB_BUILTINS_UTIL_MATH_LOG2_1500
     * @tc.desc Verify null converts to positive zero and base two logarithm returns negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathLog2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathLog2NullConversion();
      expect(result).assertEqual(-Infinity);
    });

  });
}
