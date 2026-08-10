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
  isApprox
} from '../MathTestUtils';

export default function mathRelationshipTest(): void {
  describe('MathRelationshipTest', (): void => {
    /**
     * @tc.name testMathRelationship001
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0100
     * @tc.desc Verify exp reverses log for a positive finite value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 7.25;
      const isApproxResult: boolean = isApprox(Math.exp(Math.log(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship002
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0200
     * @tc.desc Verify log reverses exp for a moderate finite exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 1.25;
      const isApproxResult: boolean = isApprox(Math.log(Math.exp(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship003
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0300
     * @tc.desc Verify expm1 agrees with exp minus one away from cancellation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.75;
      const isApproxResult: boolean = isApprox(Math.expm1(input), Math.exp(input) - 1, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship004
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0400
     * @tc.desc Verify log1p agrees with log of one plus input away from cancellation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.5;
      const isApproxResult: boolean = isApprox(Math.log1p(input), Math.log(1 + input), 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship005
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0500
     * @tc.desc Verify cbrt reverses an exact odd integer cube
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = -3;
      const isApproxResult: boolean = isApprox(Math.cbrt(Math.pow(input, 3)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship006
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0600
     * @tc.desc Verify sqrt of a finite square equals the original magnitude
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = -4;
      const result: number = Math.sqrt(input * input);
      const expected: number = Math.abs(input);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathRelationship007
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0700
     * @tc.desc Verify asin reverses sin inside its principal range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.4;
      const isApproxResult: boolean = isApprox(Math.asin(Math.sin(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship008
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0800
     * @tc.desc Verify acos reverses cos inside its principal range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.7;
      const isApproxResult: boolean = isApprox(Math.acos(Math.cos(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship009
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_0900
     * @tc.desc Verify atan reverses tan inside its principal range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.6;
      const isApproxResult: boolean = isApprox(Math.atan(Math.tan(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship010
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1000
     * @tc.desc Verify sinh reverses asinh for a finite value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 2.5;
      const isApproxResult: boolean = isApprox(Math.sinh(Math.asinh(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship011
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1100
     * @tc.desc Verify cosh reverses acosh inside the acosh domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 3.5;
      const isApproxResult: boolean = isApprox(Math.cosh(Math.acosh(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship012
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1200
     * @tc.desc Verify tanh reverses atanh inside the atanh domain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = 0.4;
      const isApproxResult: boolean = isApprox(Math.tanh(Math.atanh(input)), input, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathRelationship013
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1300
     * @tc.desc Verify hypot is homogeneous under finite scaling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scale: number = -2;
      const base: number = Math.hypot(3, 4);
      const result: number = Math.hypot(scale * 3, scale * 4);
      const expected: number = Math.abs(scale) * base;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathRelationship014
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1400
     * @tc.desc Verify max and min are dual under sign inversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: number = -7;
      const second: number = 3;
      const result: number = Math.max(first, second);
      const expected: number = -Math.min(-first, -second);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testMathRelationship015
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1500
     * @tc.desc Verify floor and ceil enclose a noninteger finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = -2.75;
      const floorResult: number = Math.floor(input);
      const ceilResult: number = Math.ceil(input);
      expect(floorResult).assertLessOrEqual(input);
      expect(input).assertLessOrEqual(ceilResult);
    });

    /**
     * @tc.name testMathRelationship016
     * @tc.number SUB_BUILTINS_UTIL_MATH_RELATIONSHIP_1600
     * @tc.desc Verify trunc removes less than one unit from a finite input
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRelationship016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: number = -12.875;
      const distance: number = Math.abs(input - Math.trunc(input));
      expect(distance).assertLess(1);
    });
  });
}
