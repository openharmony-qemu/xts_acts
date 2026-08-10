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
  observeMathAbsBooleanConversion,
  observeMathAbsNullConversion,
  observeMathAbsUndefinedConversion,
  observeMathAbsValueOfConversion,
  observeMathAtan2ConversionOrder,
  observeMathFloorToStringFallback,
  observeMathHypotConversionOrder,
  observeMathMaxConversionOrder,
  observeMathMinConversionOrder,
  observeMathPowConversionOrder
} from './math';
import {
  isApprox,
  isNaNValue
} from '../MathTestUtils';

export default function mathDynamicTest(): void {
  describe('MathDynamicTest', (): void => {
    /**
     * @tc.name testMathDynamic001
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0100
     * @tc.desc Verify object valueOf conversion reaches Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = observeMathAbsValueOfConversion();
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name testMathDynamic002
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0200
     * @tc.desc Verify object conversion falls back from valueOf to toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = observeMathFloorToStringFallback();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testMathDynamic003
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0300
     * @tc.desc Verify atan2 converts the Y operand before the X operand
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathAtan2ConversionOrder();
      const isApproxResult: boolean = isApprox(observation.result, Math.PI / 4, 1e-12);
      expect(isApproxResult).assertTrue();
      expect(observation.trace).assertEqual('first,second');
    });

    /**
     * @tc.name testMathDynamic004
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0400
     * @tc.desc Verify pow converts the base before the exponent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathPowConversionOrder();
      expect(observation.result).assertEqual(8);
      expect(observation.trace).assertEqual('base,exponent');
    });

    /**
     * @tc.name testMathDynamic005
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0500
     * @tc.desc Verify max converts rest arguments from left to right
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathMaxConversionOrder();
      expect(observation.result).assertEqual(7);
      expect(observation.trace).assertEqual('first,second,third');
    });

    /**
     * @tc.name testMathDynamic006
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0600
     * @tc.desc Verify min converts rest arguments from left to right
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathMinConversionOrder();
      expect(observation.result).assertEqual(-7);
      expect(observation.trace).assertEqual('first,second,third');
    });

    /**
     * @tc.name testMathDynamic007
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0700
     * @tc.desc Verify hypot converts rest arguments from left to right
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathHypotConversionOrder();
      expect(observation.result).assertEqual(5);
      expect(observation.trace).assertEqual('first,second');
    });

    /**
     * @tc.name testMathDynamic008
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0800
     * @tc.desc Verify undefined dynamically converts to NaN for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = observeMathAbsUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamic009
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_0900
     * @tc.desc Verify null dynamically converts to zero for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = observeMathAbsNullConversion();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testMathDynamic010
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_1000
     * @tc.desc Verify boolean true dynamically converts to one for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = observeMathAbsBooleanConversion();
      expect(result).assertEqual(1);
    });
  });
}
