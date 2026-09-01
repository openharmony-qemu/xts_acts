/**
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

import type shortcutManager from '@ohos.bundle.shortcutManager';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function coverageShortcutTypeExportsTest() {
  describe('CoverageShortcutTypeExportsTest', () => {
    /**
     * @tc.name   SUB_BMS_FRAMEWORK_ShortcutManager_TypeExports_9401
     * @tc.number SUB_BMS_FRAMEWORK_ShortcutManager_TypeExports_9401
     * @tc.desc   Cover shortcutManager ShortcutWant / ParameterItem type exports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_ShortcutManager_TypeExports_9401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const parameter: shortcutManager.ParameterItem = {
          key: 'source',
          value: 'coverage'
        };
        const want: shortcutManager.ShortcutWant = {
          targetBundle: 'com.example.shortcuttest',
          targetModule: 'entry',
          targetAbility: 'EntryAbility',
          parameters: [parameter]
        };
        expect(want.parameters?.[0].value).assertEqual('coverage');
        done();
      });
  });
}
