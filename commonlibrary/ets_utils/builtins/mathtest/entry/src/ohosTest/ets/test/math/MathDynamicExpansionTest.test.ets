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
  observeMathAbsEmptyArrayConversion,
  observeMathAbsEmptyStringConversion,
  observeMathAbsFalseConversion,
  observeMathAbsInvalidStringConversion,
  observeMathAbsMultiElementArrayConversion,
  observeMathAbsNumberObjectConversion,
  observeMathAbsSingleElementArrayConversion,
  observeMathAbsSymbolToPrimitive,
  observeMathAbsValueOfErrorPropagation,
  observeMathAbsValueOfPrecedence,
  observeMathAbsWhitespaceStringConversion,
  observeMathAtan2BooleanConversion,
  observeMathAtan2FirstErrorStopsSecond,
  observeMathClz32ObjectConversion,
  observeMathFloorValueOfAbruptCompletion,
  observeMathFroundObjectConversion,
  observeMathHypotConvertsAfterInfinity,
  observeMathHypotFirstErrorStopsSecond,
  observeMathImulFirstErrorStopsSecond,
  observeMathImulObjectConversionOrder,
  observeMathMaxConvertsAfterNaN,
  observeMathMaxMiddleErrorStopsFollowing,
  observeMathMaxMixedPrimitiveConversion,
  observeMathMinUndefinedConversion,
  observeMathPowArrayConversion,
  observeMathPowBaseErrorStopsExponent,
  observeMathRoundNegativeStringZero,
  observeMathSignNegativeStringZero
} from './math';
import {
  isApprox,
  isNaNValue,
  isNegativeZero
} from '../MathTestUtils';

export default function mathDynamicExpansionTest(): void {
  describe('MathDynamicExpansionTest', (): void => {
    /**
     * @tc.name testMathDynamicExpansion001
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0100
     * @tc.desc Verify false dynamically converts to zero for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsFalseConversion();
      expect(observedResult).assertEqual(0);
    });

    /**
     * @tc.name testMathDynamicExpansion002
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0200
     * @tc.desc Verify an empty string dynamically converts to zero for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsEmptyStringConversion();
      expect(observedResult).assertEqual(0);
    });

    /**
     * @tc.name testMathDynamicExpansion003
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0300
     * @tc.desc Verify a whitespace string dynamically converts to zero for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsWhitespaceStringConversion();
      expect(observedResult).assertEqual(0);
    });

    /**
     * @tc.name testMathDynamicExpansion004
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0400
     * @tc.desc Verify a nonnumeric string dynamically produces NaN for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsInvalidStringConversion();
      const isNaNResult: boolean = isNaNValue(observedResult);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamicExpansion005
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0500
     * @tc.desc Verify an empty array dynamically converts to zero for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsEmptyArrayConversion();
      expect(observedResult).assertEqual(0);
    });

    /**
     * @tc.name testMathDynamicExpansion006
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0600
     * @tc.desc Verify a single element array dynamically converts through its string form
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsSingleElementArrayConversion();
      expect(observedResult).assertEqual(6.5);
    });

    /**
     * @tc.name testMathDynamicExpansion007
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0700
     * @tc.desc Verify a multi element array dynamically produces NaN for Math abs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsMultiElementArrayConversion();
      const isNaNResult: boolean = isNaNValue(observedResult);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamicExpansion008
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0800
     * @tc.desc Verify a Number wrapper dynamically converts to its primitive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathAbsNumberObjectConversion();
      expect(observedResult).assertEqual(9);
    });

    /**
     * @tc.name testMathDynamicExpansion009
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_0900
     * @tc.desc Verify valueOf takes precedence over toString during numeric conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathAbsValueOfPrecedence();
      expect(observation.result).assertEqual(8);
      expect(observation.trace).assertEqual('valueOf');
    });

    /**
     * @tc.name testMathDynamicExpansion010
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1000
     * @tc.desc Verify Symbol toPrimitive receives the number hint before fallback hooks
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathAbsSymbolToPrimitive();
      expect(observation.result).assertEqual(12);
      expect(observation.trace).assertEqual('number');
    });

    /**
     * @tc.name testMathDynamicExpansion011
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1100
     * @tc.desc Verify clz32 applies object conversion before unsigned wrapping
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathClz32ObjectConversion();
      expect(observedResult).assertEqual(31);
    });

    /**
     * @tc.name testMathDynamicExpansion012
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1200
     * @tc.desc Verify imul converts object operands from left to right
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathImulObjectConversionOrder();
      expect(observation.result).assertEqual(-42);
      expect(observation.trace).assertEqual('left,right');
    });

    /**
     * @tc.name testMathDynamicExpansion013
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1300
     * @tc.desc Verify fround converts an object before single precision rounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathFroundObjectConversion();
      expect(observedResult).assertEqual(1.5);
    });

    /**
     * @tc.name testMathDynamicExpansion014
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1400
     * @tc.desc Verify round preserves negative zero after dynamic string conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathRoundNegativeStringZero();
      const isNegativeZeroResult: boolean = isNegativeZero(observedResult);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamicExpansion015
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1500
     * @tc.desc Verify sign preserves negative zero after dynamic string conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathSignNegativeStringZero();
      const isNegativeZeroResult: boolean = isNegativeZero(observedResult);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamicExpansion016
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1600
     * @tc.desc Verify max converts mixed primitive arguments before comparison
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathMaxMixedPrimitiveConversion();
      expect(observedResult).assertEqual(8);
    });

    /**
     * @tc.name testMathDynamicExpansion017
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1700
     * @tc.desc Verify undefined dynamically poisons a min reduction with NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathMinUndefinedConversion();
      const isNaNResult: boolean = isNaNValue(observedResult);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamicExpansion018
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1800
     * @tc.desc Verify pow converts single element arrays to numeric operands
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observedResult: number = observeMathPowArrayConversion();
      expect(observedResult).assertEqual(8);
    });

    /**
     * @tc.name testMathDynamicExpansion019
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_1900
     * @tc.desc Verify atan2 converts boolean operands in parameter order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const isApproxResult: boolean = isApprox(observeMathAtan2BooleanConversion(), Math.PI / 2, 1e-12);
      expect(isApproxResult).assertTrue();
    });

    /**
     * @tc.name testMathDynamicExpansion020
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2000
     * @tc.desc Verify abs propagates the exact error thrown by valueOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathAbsValueOfErrorPropagation();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-abs-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('valueOf');
    });

    /**
     * @tc.name testMathDynamicExpansion021
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2100
     * @tc.desc Verify a valueOf error prevents the toString fallback for floor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathFloorValueOfAbruptCompletion();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-floor-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('valueOf');
    });

    /**
     * @tc.name testMathDynamicExpansion022
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2200
     * @tc.desc Verify an atan2 Y conversion error prevents X conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathAtan2FirstErrorStopsSecond();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-atan2-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('first');
    });

    /**
     * @tc.name testMathDynamicExpansion023
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2300
     * @tc.desc Verify a pow base conversion error prevents exponent conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathPowBaseErrorStopsExponent();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-pow-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('base');
    });

    /**
     * @tc.name testMathDynamicExpansion024
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2400
     * @tc.desc Verify a max conversion error prevents later rest argument conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathMaxMiddleErrorStopsFollowing();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-max-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('first,second');
    });

    /**
     * @tc.name testMathDynamicExpansion025
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2500
     * @tc.desc Verify a hypot conversion error prevents later rest argument conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathHypotFirstErrorStopsSecond();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-hypot-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('first');
    });

    /**
     * @tc.name testMathDynamicExpansion026
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2600
     * @tc.desc Verify an imul left conversion error prevents right conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathImulFirstErrorStopsSecond();
      expect(observation.errorName).assertEqual('Error');
      expect(observation.errorMessage).assertEqual('math-imul-sentinel');
      expect(observation.sameError).assertTrue();
      expect(observation.trace).assertEqual('first');
    });

    /**
     * @tc.name testMathDynamicExpansion027
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2700
     * @tc.desc Verify max still converts later arguments after observing NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathMaxConvertsAfterNaN();
      const isNaNResult: boolean = isNaNValue(observation.result);
      expect(isNaNResult).assertTrue();
      expect(observation.trace).assertEqual('first,second,third');
    });

    /**
     * @tc.name testMathDynamicExpansion028
     * @tc.number SUB_BUILTINS_UTIL_MATH_DYNAMIC_EXPANSION_2800
     * @tc.desc Verify hypot converts all arguments before Infinity dominates NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathDynamicExpansion028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const observation = observeMathHypotConvertsAfterInfinity();
      expect(observation.result).assertEqual(Infinity);
      expect(observation.trace).assertEqual('first,second,third');
    });
  });
}
