/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { Configuration } from '@ohos.app.ability.Configuration';

export default class ModuleAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log('[Demo] MainAbility onCreate');
  }

  onDestroy() {
    console.log('[Demo] MainAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    console.log('[Demo] MainAbility onWindowStageCreate');
    windowStage.loadContent('pages/index', null);
  }

  onWindowStageDestroy() {
    console.log('[Demo] MainAbility onWindowStageDestroy');
  }

  onWindowStageRestore(windowStage: window.WindowStage) {
    console.log('[Demo] MainAbility onWindowStageRestore');
  }

  onForeground() {
    console.log('[Demo] MainAbility onForeground');
  }

  onBackground() {
    console.log('[Demo] MainAbility onBackground');
  }

  onContinue(wantParam: Record<string, Object>): AbilityConstant.OnContinueResult {
    console.log('[Demo] MainAbility onContinue');
    return AbilityConstant.OnContinueResult.AGREE;
  }

  onConfigurationUpdate(config: Configuration) {
    console.log('[Demo] MainAbility onConfigurationUpdate: ' + JSON.stringify(config));
  }

  onDump(param: Array<string>): Array<string> {
    console.log('[Demo] MainAbility onDump: ' + JSON.stringify(param));
    return ['MainAbility'];
  }
}
