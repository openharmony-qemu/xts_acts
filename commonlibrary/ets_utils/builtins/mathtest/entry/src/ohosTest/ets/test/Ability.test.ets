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

export default function abilityTest(): void {

  describe('Ability', (): void => {
    /**
     * @tc.name   testAbilityDynamic001
     * @tc.number SUB_BUILTINS_ABILITY_DYNAMIC_0100
     * @tc.desc   Verify number assignment compatibility in ArkTS 1.1 Dynamic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAbilityDynamic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a: number = 1;
      const b: number = 1;
      expect(a).assertEqual(b);
    });
  });

}
