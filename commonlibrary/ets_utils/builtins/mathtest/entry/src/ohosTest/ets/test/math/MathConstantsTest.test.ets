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
  readMathToStringTag
} from './MathSymbolToStringTag';


export default function mathConstantsTest(): void {
  describe('MathConstantsTest', (): void => {
    /**
     * @tc.name testMathConstants001
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0100
     * @tc.desc Verify Symbol toStringTag identifies the Math object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = readMathToStringTag();
      expect(result).assertEqual('Math');
    });

    /**
     * @tc.name testMathConstants002
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0200
     * @tc.desc Verify E exposes the Euler constant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.E).assertEqual(2.718281828459045);
    });

    /**
     * @tc.name testMathConstants003
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0300
     * @tc.desc Verify LN10 exposes the natural logarithm of ten
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.LN10).assertEqual(2.302585092994046);
    });

    /**
     * @tc.name testMathConstants004
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0400
     * @tc.desc Verify LN2 exposes the natural logarithm of two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.LN2).assertEqual(0.6931471805599453);
    });

    /**
     * @tc.name testMathConstants005
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0500
     * @tc.desc Verify LOG10E exposes the base ten logarithm of E
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.LOG10E).assertEqual(0.4342944819032518);
    });

    /**
     * @tc.name testMathConstants006
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0600
     * @tc.desc Verify LOG2E exposes the base two logarithm of E
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.LOG2E).assertEqual(1.4426950408889634);
    });

    /**
     * @tc.name testMathConstants007
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0700
     * @tc.desc Verify PI exposes the circle ratio constant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.PI).assertEqual(3.141592653589793);
    });

    /**
     * @tc.name testMathConstants008
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0800
     * @tc.desc Verify SQRT1_2 exposes the square root of one half
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.SQRT1_2).assertEqual(0.7071067811865476);
    });

    /**
     * @tc.name testMathConstants009
     * @tc.number SUB_BUILTINS_UTIL_MATH_CONSTANTS_0900
     * @tc.desc Verify SQRT2 exposes the square root of two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathConstants009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Math.SQRT2).assertEqual(1.4142135623730951);
    });

  });
}
