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
  observeMathClz32HexStringConversion,
  observeMathClz32NullConversion,
  observeMathClz32StringConversion
} from './MathClz32';


function callMathClz32WithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.clz32(input);
  }
  return Math.clz32(Number(input));
}

export default function mathClz32Test(): void {
  describe('MathClz32Test', (): void => {
    /**
     * @tc.name testMathClz32001
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0100
     * @tc.desc Verify zero has thirty two leading zero bits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(0);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathClz32002
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0200
     * @tc.desc Verify one has thirty one leading zero bits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(1);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name testMathClz32003
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0300
     * @tc.desc Verify negative one converts to all one bits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(-1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathClz32004
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0400
     * @tc.desc Verify fractional input is converted through ToUint32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(1.9);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name testMathClz32005
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0500
     * @tc.desc Verify NaN converts to zero before counting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(NaN);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathClz32006
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathClz32WithUnion(1);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name testMathClz32007
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathClz32WithUnion('1');
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name testMathClz32008
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathClz32StringConversion();
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name testMathClz32009
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_0900
     * @tc.desc Verify positive Infinity converts to zero before counting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(Infinity);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathClz32010
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1000
     * @tc.desc Verify the sign bit boundary has no leading zero bits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(2147483648);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathClz32011
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1100
     * @tc.desc Verify two to the power thirty two plus one wraps to one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(4294967297);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name testMathClz32012
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1200
     * @tc.desc Verify negative two to the power thirty two wraps to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(-4294967296);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathClz32013
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1300
     * @tc.desc Verify negative fractional input truncates before unsigned conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(-1.5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathClz32014
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1400
     * @tc.desc Verify signed int maximum has one leading zero bit
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(2147483647);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testMathClz32015
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1500
     * @tc.desc Verify signed int minimum has no leading zero bits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.clz32(-2147483648);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathClz32016
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1600
     * @tc.desc Verify null converts to zero before counting leading zero bits
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathClz32NullConversion();
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testMathClz32017
     * @tc.number SUB_BUILTINS_UTIL_MATH_CLZ32_1700
     * @tc.desc Verify a hexadecimal string converts to the unsigned high bit value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathClz32017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathClz32HexStringConversion();
      expect(result).assertEqual(0);
    });

  });
}
