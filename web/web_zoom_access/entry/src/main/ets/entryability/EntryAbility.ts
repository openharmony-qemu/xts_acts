/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import Window from '@ohos.window';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';

export default class EntryAbility extends UIAbility {
  onWindowStageCreate(windowStage: Window.WindowStage) {
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        return;
      }
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
        AbilityDelegatorRegistry.getAbilityDelegator();
      let args: AbilityDelegatorRegistry.AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
      let monitor: AbilityDelegatorRegistry.AbilityMonitor = {
        abilityName: args.bundleName,
        onAbilityCreate: () => {
          console.info('addAbilityMonitor called');
        },
      };
      abilityDelegator.addAbilityMonitor(monitor, (error: BusinessError) => {
        if (error != null) {
          console.info('addAbilityMonitor err ' + error.code);
        }
      });
    });
  }
}
