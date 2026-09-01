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

import type launcherBundleManager from '@ohos.bundle.launcherBundleManager';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function coverageLauncherTypeExportsTest() {
  describe('CoverageLauncherTypeExportsTest', () => {
    /**
     * @tc.name   SUB_BMS_FRAMEWORK_LauncherBundleManager_TypeExports_9400
     * @tc.number SUB_BMS_FRAMEWORK_LauncherBundleManager_TypeExports_9400
     * @tc.desc   Cover ShortcutInfo / ShortcutWant / ParameterItem type exports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BMS_FRAMEWORK_LauncherBundleManager_TypeExports_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const parameter: launcherBundleManager.ParameterItem = {
          key: 'source',
          value: 'coverage'
        };
        const want: launcherBundleManager.ShortcutWant = {
          targetBundle: 'ohos.acts.bms.getlauncherabilityinfo2.test',
          targetModule: 'entry',
          targetAbility: 'EntryAbility',
          parameters: [parameter]
        };
        const shortcut: launcherBundleManager.ShortcutInfo = {
          id: 'coverage_shortcut',
          bundleName: 'ohos.acts.bms.getlauncherabilityinfo2.test',
          moduleName: 'entry',
          hostAbility: 'EntryAbility',
          appIndex: 0,
          sourceType: 1,
          wants: [want],
          visible: true
        };
        expect(shortcut.wants?.[0].parameters?.[0].value).assertEqual('coverage');
        done();
      });
  });
}
