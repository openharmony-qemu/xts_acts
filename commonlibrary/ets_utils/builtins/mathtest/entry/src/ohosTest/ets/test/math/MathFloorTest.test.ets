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
  observeMathFloorNullConversion,
  observeMathFloorStringConversion
} from './MathFloor';
import {
  isNaNValue,
  isNegativeZero,
  isPositiveZero
} from '../MathTestUtils';

function callMathFloorWithUnion(input: number | string): number {
  if (typeof input === 'number') {
    return Math.floor(input);
  }
  return Math.floor(Number(input));
}

export default function mathFloorTest(): void {
  describe('MathFloorTest', (): void => {
    /**
     * @tc.name testMathFloor001
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0100
     * @tc.desc Verify positive fraction rounds toward negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(3.8);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathFloor002
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0200
     * @tc.desc Verify negative fraction rounds toward negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(-3.2);
      expect(result).assertEqual(-4);
    });

    /**
     * @tc.name testMathFloor003
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0300
     * @tc.desc Verify negative zero remains negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(-0);
      const isNegativeZeroResult: boolean = isNegativeZero(result);
      expect(isNegativeZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathFloor004
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0400
     * @tc.desc Verify negative Infinity remains negative Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(-Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name testMathFloor005
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0500
     * @tc.desc Verify NaN input produces NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(NaN);
      const isNaNResult: boolean = isNaNValue(result);
      expect(isNaNResult).assertTrue();
    });

    /**
     * @tc.name testMathFloor006
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0600
     * @tc.desc Verify number union member reaches the Math call directly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathFloorWithUnion(3.8);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathFloor007
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0700
     * @tc.desc Verify string union member is normalized before the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = callMathFloorWithUnion('3.8');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathFloor008
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0800
     * @tc.desc Verify member-local JavaScript string coercion reaches the Math call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathFloorStringConversion();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testMathFloor009
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_0900
     * @tc.desc Verify positive zero remains positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(0);
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

    /**
     * @tc.name testMathFloor010
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_1000
     * @tc.desc Verify positive Infinity remains positive Infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.floor(Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name testMathFloor011
     * @tc.number SUB_BUILTINS_UTIL_MATH_FLOOR_1100
     * @tc.desc Verify null converts to positive zero for floor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathFloor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = observeMathFloorNullConversion();
      const isPositiveZeroResult: boolean = isPositiveZero(result);
      expect(isPositiveZeroResult).assertTrue();
    });

  });
}
