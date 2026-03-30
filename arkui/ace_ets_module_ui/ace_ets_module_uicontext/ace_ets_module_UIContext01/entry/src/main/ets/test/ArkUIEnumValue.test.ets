/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';

export default function ArkUIEnumValueTest() {
  describe('ArkUIEnumValueTest', () => {
    /**
     * @tc.number   competition_strategy_default_zero_0100
     * @tc.name     competition_strategy_default_zero_0100
     * @tc.desc     enums CompetitionStrategy.DEFAULT value is 0 (BuilderNode postInput competition default)
     * @tc.level    Level.LEVEL0
     */
    it('competition_strategy_default_zero_0100', Level.LEVEL0, () => {
      expect(CompetitionStrategy.DEFAULT).assertEqual(0);
    });
    /**
     * @tc.number   competition_strategy_competition_one_0100
     * @tc.name     competition_strategy_competition_one_0100
     * @tc.desc     enums CompetitionStrategy.COMPETITION value is 1
     * @tc.level    Level.LEVEL0
     */
    it('competition_strategy_competition_one_0100', Level.LEVEL0, () => {
      expect(CompetitionStrategy.COMPETITION).assertEqual(1);
    });
    /**
     * @tc.number   navigation_mode_auto_with_aspect_ratio_0100
     * @tc.name     navigation_mode_auto_with_aspect_ratio_0100
     * @tc.desc     navigation NavigationMode.AUTO_WITH_ASPECT_RATIO numeric value is 3
     * @tc.level    Level.LEVEL0
     */
    it('navigation_mode_auto_with_aspect_ratio_0100', Level.LEVEL0, () => {
      expect(NavigationMode.AUTO_WITH_ASPECT_RATIO).assertEqual(3);
    });
  });
}
