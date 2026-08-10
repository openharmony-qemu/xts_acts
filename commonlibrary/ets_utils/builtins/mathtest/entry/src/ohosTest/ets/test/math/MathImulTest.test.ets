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
  observeMathImulNullXConversion,
  observeMathImulNullYConversion,
  observeMathImulStringConversion
} from './MathImul';


function callMathImulWithUnion(first: number | string, second: number | string): number {
  const firstValue: number = typeof first === 'number' ? first : Number(first);
  const secondValue: number = typeof second === 'number' ? second : Number(second);
  return Math.imul(firstValue, secondValue);
}

export default function mathImulTest(): void {
  describe('MathImulTest', (): void => {
    /**
     * @tc.name testMathImul001
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0100
     * @tc.desc Verify small positive operands return exact 32 bit product
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(2, 4);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathImul002
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0200
     * @tc.desc Verify negative operand preserves the product sign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(-1, 8);
      expect(result).assertEqual(-8);
    });

    /**
     * @tc.name testMathImul003
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0300
     * @tc.desc Verify unsigned all one bits are interpreted as negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(0xffffffff, 5);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name testMathImul004
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0400
     * @tc.desc Verify 32 bit overflow wraps to a signed result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(0x7fffffff, 2);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name testMathImul005
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0500
     * @tc.desc Verify fractional operands are converted to 32 bit integers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(2.9, 3.9);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name testMathImul006
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0600
     * @tc.desc Verify NaN converts to zero before multiplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(NaN, 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathImul007
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0700
     * @tc.desc Verify number union members reach the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathImulWithUnion(2, 4);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathImul008
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0800
     * @tc.desc Verify string union members are normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathImulWithUnion('2', '4');
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathImul009
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_0900
     * @tc.desc Verify member-local JavaScript string operands undergo numeric coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathImulStringConversion();
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testMathImul010
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_1000
     * @tc.desc Verify two to the power thirty two wraps to zero before multiplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(4294967296, 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathImul011
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_1100
     * @tc.desc Verify Infinity converts to zero before multiplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.imul(Infinity, 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathImul012
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_1200
     * @tc.desc Verify null in the first operand converts to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathImulNullXConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathImul013
     * @tc.number SUB_BUILTINS_UTIL_MATH_IMUL_1300
     * @tc.desc Verify null in the second operand converts to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathImul013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathImulNullYConversion();
      expect(result).assertEqual(0);
    });

  });
}
