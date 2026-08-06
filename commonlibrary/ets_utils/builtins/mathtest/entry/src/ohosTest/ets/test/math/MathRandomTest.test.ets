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
  isFiniteValue
} from '../MathTestUtils';

export default function mathRandomTest(): void {
  describe('MathRandomTest', (): void => {
    /**
     * @tc.name testMathRandom001
     * @tc.number SUB_BUILTINS_UTIL_MATH_RANDOM_0100
     * @tc.desc Verify single result is finite and within the half open unit interval
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = Math.random();
      expect(result).assertLargerOrEqual(0);
      expect(result).assertLess(1);
      const isFiniteResult: boolean = isFiniteValue(result);
      expect(isFiniteResult).assertTrue();
    });

    /**
     * @tc.name testMathRandom002
     * @tc.number SUB_BUILTINS_UTIL_MATH_RANDOM_0200
     * @tc.desc Verify repeated results remain within the stable range invariant
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMathRandom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let index: number = 0; index < 32; index++) {
        const result: number = Math.random();
        expect(result).assertLargerOrEqual(0);
        expect(result).assertLess(1);
      }
    });

  });
}
